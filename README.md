FITSDataset
===

This package contains a custom PyTorch Dataset for quick and easy training on FITS files, commonly used in astronomical data analysis. In particular, the `FITSDataset` class caches FITS files as PyTorch tensors for the purpose of increasing training speed.

Contributions and feedback are welcome; please open a pull request or an issue.

## Quickstart
Using Python 3.6+, install from source with
```bash
pip install fitsdataset
```

Create a toy dataset with samples from the
[Hyper Suprime-Cam survey](https://www.naoj.org/Projects/HSC/) with:
```python
>>> from fitsdataset import FITSDataset
>>> dataset = FITSDataset("path/to/examples/hsc/", size=101, label_col="target")
```

Notice that the cached tensors appear in `path/to/examples/hsc/tensors`.

## Documentation
```
class FITSDataset(torch.utils.data.dataset.Dataset)
 |  FITSDataset(data_dir, size, label_col, filename_col='file_name', channels=1, transform=None)
 |  
 |  Dataset from FITS files. Pre-caches FITS files as PyTorch tensors to
 |  improve data load speed while training.
 |  
 |  Method resolution order:
 |      FITSDataset
 |      torch.utils.data.dataset.Dataset
 |      builtins.object
 |  
 |  Methods defined here:
 |  
 |  __getitem__(self, index)
 |      Magic method to index into the dataset.
 |  
 |  __init__(self, data_dir, size, label_col, filename_col='file_name', channels=1, transform=None)
 |      Instantiates a FITS dataset backed by a data directory. The data
 |      directory should have the following structure:
 |      
 |      path/to/data/
 |          info.csv
 |          cutouts/
 |              img1.fits
 |              img2.fits
 |              ...
 |      
 |      Parameters
 |      ----------
 |      data_dir : str
 |          The path to the data directory. This directory should contain an
 |          info.csv file and a subdirectory containing the FITS files titled
 |          cutouts/.
 |      label_col : str
 |          The name of the label column in info.csv.
 |      channels : int, optional
 |          The number of channels in the FITS images (default is 1).
 |      size : int or Tuple[int, int]
 |          The dimensions of each FITS image.
 |      transform : callable, optional
 |          Transform to apply on each input sample.
 |      
 |      Returns
 |      -------
 |      FITSDataset
 |          a PyTorch dataset
 |  
 |  __len__(self)
 |      Return the length of the dataset.
 |  
 |  load_tensor(self, filename)
 |      Load a Torch tensor from disk.
 |  
 |  ----------------------------------------------------------------------
 |  Static methods defined here:
 |  
 |  load_fits_as_tensor(filename)
 |      Read a FITS file from disk and convert it to a Torch tensor.
 |  
 ```

From the REPL:
```python
>>> from fitsdataset import FITSDataset
>>> help(FITSDataset)
```
