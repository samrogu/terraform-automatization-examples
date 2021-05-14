Asignar variables
```sh 
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
```

Correr packer:
```sh
packer validate aws-ami.json
packer build aws-ami.json
```
