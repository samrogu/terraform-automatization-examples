Inicializar terraform: Esto descargara los plugins necesarios
```sh
terraform init
```

Validar script de terraform:

```sh
terraform validate
```

Mostrar plan de ejecucion 

```sh
terraform plan
```

Guardar plan para ejecutar posterior.
```sh
terraform plan -out plan.json
```
Aplicar los cambios, esto creara un maquina virtual.

```sh
terraform apply -auto-approve plan.json
```

Si queremos destruir la maquina virtual que creamos en el paso anterior podemos ejecutar:

```sh
terraform destroy
```
