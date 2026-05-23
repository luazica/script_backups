# Backup automático de arquivos

Um pequeno script de backup local e online de arquivos.

## Funcionalidades

1. Ler uma lista de paths de pastas e arquivos;
2. Fazer o backup dos dados localmente e no Google Drive;

## Instalação

Clone o repositório:

```bash
git clone https://github/luazica/script_backup/
cd script_backup
```

Dê permissão de exexução ao script:

```bash
chmod +x backup.sh
```

Instale o RClone na sua máquina:

```bash
sudo pacman -S rclone   # para arch e derivados.

sudo dnf install rclone # para fedora.

sudo apt install rclone # para debian e derivados.
```

Configure o RClone e siga o passo a passo:

```bash
rclone config
```
1. Selecione a opção "new remote" e nomeie como "gdrive";
2. Digite 24 para usar o storage do Google Drive;
3. Ignore as options "client id" e "client secret";
4. Selecione o scope como "Full access all files";
5. Ignore a "service account file";
6. Negue a opção de configurações avançadas;
7. Confirme para autenticar sua conta no RClone pelo navegador;
8. Negue o Google Drive compartilhado;
9. Confirmar o remote do gdrive;
10. Sair das configurações.

Preencha a list.txt com os Paths de suas pastas e arquivo.
Exemplo: /home/user/workspace.

Agora é só executar:

```bash
./backup.sh
```
