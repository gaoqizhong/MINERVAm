# MINERVAm

MINERVA for multimodal data sets

Code and models for Central South University undergraduate thesis

Related Code: [shehzaadzd/MINERVA](https://github.com/shehzaadzd/MINERVA)

Datasets: 

## Build

If you are using Ubuntu, change Shell model first:

```shell
sudo dpkg-reconfigure dash  	# choose "no" in popup
```

Create python2.7 environment by Anaconda：

```shell
conda create --name python2.7 python=2.7 -y
conda activate python2.7
```

Install the various dependencies (including tensorflow-gpu 1.3.0):

```shell
sh build.sh -x
```

## Dataset

We created the OpenBG-IMG-M dataset by modifying [OpenBG-IMG](https://tianchi.aliyun.com/dataset/122271) to meet MINERVA's needs. Get OpenBG-IMG-M on []() and place it in the ```MINERVAm/datasets``` like:

```
MINERVAm
├── ...
├── datasets
|    └── OpenBG-IMG-M
|         ├── dev.txt					# validation set
|         ├── entity2text.txt			# correspondence between entity and text
│         ├── graph.txt					# graph
|         ├── relation2text.txt			# correspondence between entity and text
│         ├── test.txt					# test set
│         ├── train.txt					# training set
|         ├── images					# images corresponding to the entity
|         |    ├── ent_000000
|         |    └── ...
│         └── vocab						# vocabulary library
│              ├── create_vocab.json
│              └── relation_vocab.json
```

The statistics of OpenBG-IMG-M are as follows:

| Dataset    | # Ent   | # Rel | # Train | # Dev | # Test |
| ---------- | ------- | ----- | ------- | ----- | ------ |
| OpenBG-IMG | 27,910† | 136   | 230,087 | 5,000 | 14,675 |

## Training

Training MINERVA is easy!. The hyperparam configs for each experiments are in the [configs](https://github.com/shehzaadzd/MINERVA/tree/master/configs) directory. To start a particular experiment, just do

```shell
sh run.sh configs/preprocessed/${dataset}.sh
```

where the `${dataset}.sh` is the name of the config file. For example, 

```shell
sh run.sh configs/preprocessed/countries_s3.sh
```

## Testing

We are also releasing pre-trained models so that you can directly use MINERVA for query answering. They are located in the  [saved_models](https://github.com/shehzaadzd/MINERVA/tree/master/saved_models) directory. To load the model, set the ```load_model``` to 1 in the config file (default value 0) and ```model_load_dir``` to point to the saved_model. For example in [configs/countries_s2.sh](https://github.com/shehzaadzd/MINERVA/blob/master/configs/countries_s2.sh), make

```shell
load_model=1
model_load_dir="saved_models/countries_s2/model.ckpt"
```

The code outputs the evaluation of MINERVA on the datasets provided. The metrics used for evaluation are Hits@{1,3,5,10,20} and MRR (which in the case of Countries is AUC-PR). Along with this, the code also outputs the answers MINERVA reached in a file.

## Code Structure

The structure of the code is as follows

```
Code
├── Model
│    ├── Trainer
│    ├── Agent
│    ├── Environment
│    └── Baseline
├── Data
│    ├── Grapher
│    ├── Batcher
│    └── Data Preprocessing scripts
│            ├── create_vocab
│            ├── create_graph
│            ├── Trainer
│            └── Baseline

```

## Data Format

To run MINERVA on a custom graph based dataset, you would need the graph and the queries as triples in the form of (e<sub>1</sub>,r, e<sub>2</sub>).
Where e<sub>1</sub>, and e<sub>2</sub> are _nodes_ connected by the _edge_ r.
The vocab can of the dataset can be created using the `create_vocab.py` file found in `data/data preprocessing scripts`. The vocab needs to be stores in the json format `{'entity/relation': ID}`.
The following shows the directory structure of the Kinship dataset.

```
kinship
    ├── graph.txt
    ├── train.txt
    ├── dev.txt
    ├── test.txt
    └── Vocab
            ├── entity_vocab.json
            └── relation_vocab.json
```
