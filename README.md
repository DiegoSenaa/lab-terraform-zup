# Tutorial: Criando Usuário Root para Terraform na AWS e GCP

## 📌 Introdução
Este tutorial cobre os passos necessários para criar um usuário com permissões adequadas para o Terraform na **AWS** e no **GCP**, além de salvar as credenciais em um arquivo JSON para uso no `providers.tf`.

---

## 🔹 Criando um Usuário Root para Terraform na AWS

### 1️⃣ Criar um Usuário no IAM
1. Acesse o **AWS IAM** pelo console da AWS.
2. Clique em **Users** > **Add users**.
3. Defina um nome, por exemplo: `terraform-user`.
4. Selecione **Access key - Programmatic access**.

### 2️⃣ Atribuir Permissões
1. Escolha **Attach existing policies directly**.
2. Selecione **AdministratorAccess** (ou crie uma política personalizada com permissões mínimas).
3. Clique em **Next** e **Create user**.

### 3️⃣ Obter Credenciais
1. Após criar o usuário, baixe o **access key ID** e **secret access key**.
2. Crie um arquivo JSON chamado `aws-credentials.json` e salve as credenciais:

```json
{
  "access_key": "SEU_ACCESS_KEY",
  "secret_key": "SEU_SECRET_KEY",
  "region": "us-east-1"
}
```

### 4️⃣ Configurar Terraform Provider
Crie um arquivo `providers.tf` e configure o provider da AWS:

```hcl
provider "aws" {
  access_key = jsondecode(file("aws-credentials.json")).access_key
  secret_key = jsondecode(file("aws-credentials.json")).secret_key
  region     = jsondecode(file("aws-credentials.json")).region
}
```

---

## 🔹 Criando um Usuário Root para Terraform no GCP

### 1️⃣ Criar um Service Account
1. Acesse o **Google Cloud Console**.
2. Vá para **IAM & Admin** > **Service Accounts**.
3. Clique em **Create Service Account**.
4. Defina um nome, como `terraform-sa`.

### 2️⃣ Conceder Permissões
1. Escolha a permissão **Owner** (ou defina permissões mais restritivas).
2. Clique em **Done**.

### 3️⃣ Gerar e Salvar Credenciais
1. Selecione a conta de serviço criada.
2. Vá para **Keys** > **Add Key** > **Create new key**.
3. Escolha **JSON** e faça o download do arquivo.
4. Renomeie para `gcp-credentials.json` e armazene-o com segurança.

### 4️⃣ Configurar Terraform Provider
Crie um arquivo `providers.tf` e configure o provider do GCP:

```hcl
provider "google" {
  credentials = file("gcp-credentials.json")
  project     = "SEU_PROJETO_GCP"
  region      = "us-central1"
}
```

---

# Colinha #

### Gerar chave 

```bash 
ssh-keygen -t rsa -b 4096 -C "seu_email@example.com" -f ./key
```


### Apagar arquivos terraform
```bash 
rm -rf .terraform/ .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
```

