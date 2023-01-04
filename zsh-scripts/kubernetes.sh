kns() { kubectl config set-context --current --namespace=$1; }
kdp() { kubectl describe po $1; }
alias kjobs="k get jobs"
alias ksvc="k get svc"

