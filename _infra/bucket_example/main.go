package main

import (
	"fmt"
	"github.com/pulumi/pulumi-gcp/sdk/v6/go/gcp/storage"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi/config"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		// Create a GCP resource (Storage Bucket)
		cfg := config.New(ctx, "")
		name := cfg.Require("bucket-name")
		region := cfg.RequireSecret("region")
		fmt.Println(region.ToStringOutput())
		bucket, err := storage.NewBucket(ctx, name, &storage.BucketArgs{
			Website: storage.BucketWebsiteArgs{
				MainPageSuffix: pulumi.String("index.html"),
				NotFoundPage:   nil,
			},
			UniformBucketLevelAccess: pulumi.Bool(true),
			Project:                  pulumi.String("harness-playground"),
			Location:                 pulumi.String("US"),
		})
		if err != nil {
			return err
		}

		bucketOkect, err := storage.NewBucketObject(ctx, "index", &storage.BucketObjectArgs{
			Bucket:      bucket.Name,
			ContentType: pulumi.String("text/html"),
			Source:      pulumi.NewFileAsset("index.html"),
		})
		bucketEndpoint := pulumi.Sprintf("http://storage.googleapis.com/%s/%s", bucket.Name, bucketOkect.Name)
		if err != nil {
			return err
		}

		_, err = storage.NewBucketIAMBinding(ctx, "bucket-policy", &storage.BucketIAMBindingArgs{
			Bucket: bucket.Name,
			Role:   pulumi.String("roles/storage.objectViewer"),
			Members: pulumi.StringArray{
				pulumi.String("allUsers"),
			},
		})

		if err != nil {
			return err
		}

		// Export the DNS name of the bucket
		ctx.Export("bucketName", bucket.Url)
		ctx.Export("bucketEndpoint", bucketEndpoint)
		return nil
	})
}

//func createBucketClassLocation(w io.Writer, projectID, bucketName string) error {
//	 projectID := "my-project-id"
//	 bucketName := "bucket-name"
//	ctx := context.Background()
//	client, err := storage.NewClient(ctx)
//	if err != nil {
//		return fmt.Errorf("storage.NewClient: %v", err)
//	}
//	defer client.Close()
//
//	ctx, cancel := context.WithTimeout(ctx, time.Second*10)
//	defer cancel()
//
//	storageClassAndLocation := &storage.BucketAttrs{
//		StorageClass: "COLDLINE",
//		Location:     "asia",
//	}
//	bucket := client.Bucket(bucketName)
//	if err := bucket.Create(ctx, projectID, storageClassAndLocation); err != nil {
//		return fmt.Errorf("Bucket(%q).Create: %v", bucketName, err)
//	}
//	fmt.Fprintf(w, "Created bucket %v in %v with storage class %v\n", bucketName, storageClassAndLocation.Location, storageClassAndLocation.StorageClass)
//	return nil
//}
