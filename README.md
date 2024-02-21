# Vagrantfile Documentation

Este Vagrantfile é utilizado para configurar e provisionar uma máquina virtual com Vagrant. Ele utiliza o provedor VirtualBox e executa um script shell para provisionar o ambiente.

## Pré-requisitos

Certifique-se de ter o seguinte software instalado em sua máquina antes de utilizar este Vagrantfile:

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Como Usar

1. Clone este repositório:

   ```bash
   git clone https://github.com/renatinho1134/Vagrant-Elasticsearch.git
   ```
2. Entre na pasta (se você tiver adicionado em outra pasta, lembre-se de colocar o caminho absoluto):

   ```bash
   cd Vagrant-Elasticsearch
   ```
3. Execute o seguinte comando:

   ```bash
   Vagrant up
   ```
4. Para destruir a maquina virtual execute o seguinte comando:

   ```bash
   Vagrant destroy
   ```
   lembre-se de confirmar essa operação.
   
## Configuração da Máquina Virtual

- **Box**: Utiliza a box `ubuntu/focal64`, que é uma imagem Ubuntu 20.04 LTS.
- **Memória e CPUs**: Configurado para utilizar 4096MB de memória RAM e 3 CPUs.
- **Nome da Máquina**: O nome da máquina virtual é definido como "Vagrant-Automatico-Elasticsearch".
- **Timeout de Boot**: O timeout de boot é configurado para 1000 segundos.

## Provisionamento

Este Vagrantfile utiliza provisionamento com um script shell chamado `script.sh`, que executa o script Bash fornecido. Este script instala e configura o Elasticsearch em conjunto com o Java Development Kit (JDK) 11.

Certifique-se de ter o script `script.sh` no mesmo diretório que o `Vagrantfile` para que o provisionamento funcione corretamente.

## Ajustes Adicionais

Se necessário, você pode ajustar outras configurações conforme suas necessidades. Consulte a [documentação oficial do Vagrant](https://www.vagrantup.com/docs) para obter mais informações sobre as opções de configuração disponíveis.
