# myMINERVA

Meandering In Networks of Entities to Reach Verisimilar Answers

Code and models for Central South University undergraduate thesis

Reference: [Go for a Walk and Arrive at the Answer - Reasoning over Paths in Knowledge Bases using Reinforcement Learning](https://arxiv.org/abs/1711.05851)

Datasets: [OpenBG Benchmark：大规模开放数字商业知识图谱评测基准](https://tianchi.aliyun.com/dataset/122271)

VM address:  [featurize](https://featurize.cn/)(RTX 3080)

## Build

While using Ubuntu os, change dpkg reconfiguration first

```shell
sudo dpkg-reconfigure dash	# select "no" in the popover
```

Create python environment by Anaconda

```shell
conda create --name python2.7 python=2.7 -y
conda activate python2.7
```

Install the various python dependencies (including tensorflow)

```shell
sh build.sh -x
```

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

## Output

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
