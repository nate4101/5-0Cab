package helper;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.UUID;
import java.util.LinkedList;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectSummary;


public class S3Helper {
	
	//Credentials for my S3 Buckets 
	//TODO: Make this more secure... Either host the credential files locally on the machine.
	// Or Find another way to retrieve them. Same with the 
	private static final String ak = "AKIAXEUAKCWLCRKBQZUU";
	private static final String sk = "r0jyFWFThXxeEBOhrqkIuRiJZOQkcDYHe+1ACuQn";
	private AmazonS3 s3;
	private LinkedList<Bucket> BucketList;
	
	// Default Constructor, uses access and secret key to create a connection to "nate" AWS account.
	S3Helper() {
		AWSCredentials credentials = null;
        try {
        	credentials = new BasicAWSCredentials(ak, sk);
        } catch (Exception e) {
            throw new AmazonClientException("Cannot load the credentials. ", e);
        }

        s3 = AmazonS3ClientBuilder.standard()
            .withCredentials(new AWSStaticCredentialsProvider(credentials))
            .withRegion(Regions.CA_CENTRAL_1)
            .build();
	}
	// Constructor using overidden access key, secret key and region.
	S3Helper(Regions S3Region, String accessKey, String secretKey)
	{
		AWSCredentials credentials = null;
        try {
        	credentials = new BasicAWSCredentials(accessKey, secretKey);
        } catch (Exception e) {
            throw new AmazonClientException("Cannot load the credentials. ", e);
        }

        s3 = AmazonS3ClientBuilder.standard()
            .withCredentials(new AWSStaticCredentialsProvider(credentials))
            .withRegion(S3Region)
            .build();
	}
		 
	
}
