#!/usr/bin/env bash

data_input_dir="datasets/OpenBG-IMG-M-TXT/"       # dataset source
vocab_dir="datasets/OpenBG-IMG-M-TXT/vocab"       # vocab source
total_iterations=1000                       # total iterations
path_length=3                               # max path length
hidden_size=50                              # hidden size for the MLP
embedding_size=50                           # embedding size
batch_size=256                              # batch size
beta=0.05                                   # entropy regularization parameter
Lambda=0.05                                 # moving average parameter for baseline
use_entity_embeddings=0                     # use entity embeddings for formulation of action emedding (0,1)
train_entity_embeddings=0                   # flag for training entity embeddings
train_relation_embeddings=1                 # flag for training relation embeddings
base_output_dir="output/OpenBG-IMG-M-TXT/"      # output directory for logs and socres
load_model=0                                # use pre-trained model (0,1)
model_load_dir="null"                       # model source
nell_evaluation=0                           # create nell evaluation (0,1)