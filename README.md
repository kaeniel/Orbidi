# Orbidi Terraform and CI/CD Pipelines Guia

Este proyecto tiene como objetivo desplegar aplicaciones en AWS utilizando Terraform para la infraestructura y GitHub Actions para la CI/CD.

## Pre-requisitos

1. **Cuenta de AWS** configurada con las credenciales necesarias.
2. **Terraform** instalado en tu máquina.
3. **GitHub** configurado con acceso a los repositorios mencionados.
4. **Docker** instalado si planeas realizar pruebas locales.

## Paso 1: Configuración de Terraform

### Iniciar el proyecto de Terraform

1. Clona el repositorio:
   ```sh
   git clone https://github.com/kaeniel/Orbidi.git
   cd Orbidi
2. Inicializa Terraform:
   ```sh
   terraform init
3. Revisa el plan de implementación:
   ```sh
   terraform plan
4. Aplica el plan para desplegar la infraestructura:
   ```sh
   terraform apply
## Paso 2: Configuración de Secretos en GitHub

1. Ve a tu repositorio en GitHub.
2. Navega a Settings > Secrets and variables > Actions.
3. Agrega los siguientes valores:
- **AWS_ACCESS_KEY_ID**
- **AWS_SECRET_ACCESS_KEY**
- **ECR_REGISTRY**

## Paso 3: Despliegue con GitHub Actions

### Pipeline para App 1
1. Revisa y ajusta el archivo `.github/workflows/deploy-app1.yml` si es necesario.
2. 2. Asegúrate de que la definición de tarea ECS (`ecs_task_definition_app1.json`) esté presente y configurada correctamente en el repositorio.

### Pipeline para App 2
1. Revisa y ajusta el archivo `.github/workflows/deploy-app2.yml` si es necesario.
2. 2. Asegúrate de que la definición de tarea ECS (`ecs_task_definition_app2.json`) esté presente y configurada correctamente en el repositorio.

### Despliegue Automatico
Cada vez que hagas un push a la rama `main` de tu repositorio `simple-app1` o `simple-app2`, se disparará el pipeline de GitHub Actions que construirá la imagen Docker y la desplegará en ECS.

### Notas Adicionales
- Asegúrate de que todos los recursos de AWS necesarios (como roles IAM, registros ECR, etc.) estén correctamente configurados antes de iniciar el despliegue.
- Revisa los logs de las acciones de GitHub para solucionar cualquier problema que pueda surgir durante el proceso de despliegue.
