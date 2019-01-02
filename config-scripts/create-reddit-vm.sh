gcloud compute --project=infra-221016 instances create reddit-app-instance \
--zone=europe-west1-d \
--machine-type=f1-micro \
--tags=puma-server \
--image=reddit-full-1542378397 \
--image-project=infra-221016 \
--boot-disk-size=10GB \
--boot-disk-type=pd-standard
