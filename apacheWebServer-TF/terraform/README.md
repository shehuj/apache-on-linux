# apache-on-linux
Apache webserver on Linux EC2.

file Tree
.
├── modules
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── webserver/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── main.tf
├── variables.tf
└── outputs.tf

> terraform init
> terraform plan
> terraform apply -auto-approve
