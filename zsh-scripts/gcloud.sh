
# |gcloud|
gproj() { gcloud config set project $1; }
alias gli='gcloud compute instances list'
gshell() { gcloud compute ssh $1 --zone $(gcloud compute instances list | grep "$1" | awk '{ print $2 }'); }

