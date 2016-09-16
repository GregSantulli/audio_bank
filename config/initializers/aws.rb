

Aws.config.update({
  region: 'us-west-2',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
})

s3 = Aws::S3::Resource.new
BUCKET = s3.bucket(ENV['S3_BUCKET_NAME'])