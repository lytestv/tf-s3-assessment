# Variable used for blocking access + versioning block + .txt upload
variable "bucket" {
    description = "s3 bucket name will be determined by user input"
    type = list(object({
        name  = string
        id = string
  }))

  default = [{ 
        name = "s3-tf-bucketmichael" 
        id = "s3-tf-bucketmichael"
   }]    
}

# Creating extra var for s3 bucket resource itself. 
# For blocking access + versioning + upload I need to pass in an ID which required me to pass in a list and reference the first item in the list [0]
variable "bucket_name" {
    type = string
}
