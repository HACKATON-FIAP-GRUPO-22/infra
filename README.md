# Infraestrutura do Hackathon

Este projeto contém a configuração de infraestrutura como código (IaC) utilizando Terraform para provisionar e gerenciar recursos na AWS. Ele foi desenvolvido para atender às necessidades do hackathon, incluindo serviços como Cognito, RDS, S3, SQS e Kubernetes (EKS).

## Pré-requisitos

- Terraform 1.1.9 ou superior
- Conta AWS com permissões adequadas
- AWS CLI configurado
- Git instalado

## Configuração

1. Clone o repositório:
   ```bash
   git clone <url-do-repositorio>
   cd infra
   ```
2. Configure suas credenciais AWS:
   ```bash
   export AWS_ACCESS_KEY_ID=<seu-access-key-id>
   export AWS_SECRET_ACCESS_KEY=<seu-secret-access-key>
   export AWS_REGION=us-east-1
   ```
3. Inicialize o Terraform:
   ```bash
   terraform init
   ```
4. Aplique as mudanças do Terraform:
   ```bash
   terraform apply -auto-approve
   ```
## Estrutura do Projeto

O projeto está organizado da seguinte forma:

```
infra/
├── modules/          # Módulos reutilizáveis do Terraform
├── environments/     # Configurações específicas para cada ambiente (dev, staging, prod)
├── scripts/          # Scripts auxiliares para automação
├── main.tf           # Arquivo principal do Terraform
├── variables.tf      # Definição de variáveis
├── outputs.tf        # Saídas do Terraform
└── README.md         # Documentação do projeto
```

## Recursos Provisionados

Este projeto provisiona os seguintes recursos na AWS:

- **Amazon Cognito**: Gerenciamento de autenticação e autorização.
- **Amazon RDS**: Banco de dados relacional para armazenamento de dados.
- **Amazon S3**: Armazenamento de objetos para arquivos e backups.
- **Amazon SQS**: Fila de mensagens para comunicação assíncrona.
- **Amazon EKS**: Cluster Kubernetes para orquestração de contêineres.



## Guia de Configuração
1. **Clonagem do Repositório**
   ```bash
   git clone <URL_do_repositório>
   cd <nome_do_repositório>
