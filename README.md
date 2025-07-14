# milling-fault-diagnosis-knowledge-distillation
# Milling Machine Fault Diagnosis using Knowledge Distillation (Teacher-Student Framework)


# Milling Machine Fault Diagnosis using Knowledge Distillation (Teacher-Student Framework)

This repository provides the implementation of a fault diagnosis system for milling machines using a **knowledge distillation (KD)** approach. A deep **teacher model** trains a lightweight **student model**, transferring knowledge to enhance performance in data-limited and resource-constrained environments.

---

## Overview

- **Problem**: Fault diagnosis in milling machines using Acoustic Emission (AE) signals or vibration data.
- **Solution**: Use a **teacher-student knowledge distillation** pipeline to train an efficient student model that maintains high performance with reduced complexity.
- **Dataset**: Milling machine AE/CWT scalogram images.
- **Goal**: Improve classification accuracy while reducing model size and inference time.

---

## Key Features

- ✅ Teacher-Student KD Framework
- ✅ Works with scalogram or raw signal data
- ✅ CNN/ViT backbone support
- ✅ Pseudo-labeling for semi-supervised learning
- ✅ High classification performance under few-shot conditions
- ✅ Modular and easy-to-use PyTorch implementation

---

## Model Architecture

- **Teacher Model**: Heavy model (e.g., ViT, EfficientNet-B0) trained on full dataset
- **Student Model**: Lightweight CNN trained with guidance from teacher using:
  - Soft targets (logits)
  - Hard targets (true labels)
  - Distillation loss: `KD_Loss = α * CE_Loss + (1-α) * KL_Divergence`

