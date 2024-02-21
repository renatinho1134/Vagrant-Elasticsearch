#!/bin/bash

echo "Atualizando o servidor"
echo "----------------------"
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y openjdk-11-jdk

echo "----------------Download ElasticSearch--------------------"
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo apt-get install apt-transport-https

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

echo "-------------------------------------------------------------"


echo "----------------Instalando o ElasticSearch---------------------"
sudo apt-get update && sudo apt-get install elasticsearch -y

echo "-----------------------------------------------------"


echo "-----------Alterações no arquivo yaml-------------"

# Remove os comentários das linhas relevantes
sudo sed -i '/^#node.name:/s/^#//' /etc/elasticsearch/elasticsearch.yml
sudo sed -i '/^#network.host:/s/^#//' /etc/elasticsearch/elasticsearch.yml
sudo sed -i '/^#discovery.seed_hosts:/s/^#//' /etc/elasticsearch/elasticsearch.yml
sudo sed -i '/^#cluster.initial_master_nodes:/s/^#//' /etc/elasticsearch/elasticsearch.yml

# Substitui os valores das configurações
sudo sed -i 's/^network.host: .*/network.host: 0.0.0.0/' /etc/elasticsearch/elasticsearch.yml
sudo sed -i 's/^discovery.seed_hosts: .*/discovery.seed_hosts: ["127.0.0.1"]/' /etc/elasticsearch/elasticsearch.yml
sudo sed -i 's/^cluster.initial_master_nodes: .*/cluster.initial_master_nodes: ["node-1"]/' /etc/elasticsearch/elasticsearch.yml

# Saída de confirmação //adicionar condições de verificação de alteração*
echo "Configuração do arquivo elasticsearch.yml concluída com sucesso."

echo "------------Startando Elasticsearch-------------"
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
