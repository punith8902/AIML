 # import necessary libraries
import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn.naive_bayes import GaussianNB
# Load Data from CSV
data = pd.read_csv('tennisdata.csv')
print("The first 5 Values of data is :\n", data.head())
11/5/23, 10:13 AM NaiveBayesian - Jupyter Notebook
localhost:8888/notebooks/Untitled Folder 2/NaiveBayesian.ipynb 3/7
---------------------------------------------------------------------------
FileNotFoundError Traceback (most recent call last)
Cell In[1], line 7
 4 from sklearn.naive_bayes import GaussianNB
 6 # Load Data from CSV
----> 7 data = pd.read_csv('tennisdata.csv')
 8 print("The first 5 Values of data is :\n", data.head())
File ~\anaconda3\Lib\site-packages\pandas\util\_decorators.py:211, in deprecate_kwarg.<locals>._deprecate_kwarg.<loca
ls>.wrapper(*args, **kwargs)
 209 else:
 210 kwargs[new_arg_name] = new_arg_value
--> 211 return func(*args, **kwargs)
File ~\anaconda3\Lib\site-packages\pandas\util\_decorators.py:331, in deprecate_nonkeyword_arguments.<locals>.decorat
e.<locals>.wrapper(*args, **kwargs)
 325 if len(args) > num_allow_args:
 326 warnings.warn(
 327 msg.format(arguments=_format_argument_list(allow_args)),
 328 FutureWarning,
 329 stacklevel=find_stack_level(),
 330 )
--> 331 return func(*args, **kwargs)
File ~\anaconda3\Lib\site-packages\pandas\io\parsers\readers.py:950, in read_csv(filepath_or_buffer, sep, delimiter,
header, names, index_col, usecols, squeeze, prefix, mangle_dupe_cols, dtype, engine, converters, true_values, false_v
alues, skipinitialspace, skiprows, skipfooter, nrows, na_values, keep_default_na, na_filter, verbose, skip_blank_line
s, parse_dates, infer_datetime_format, keep_date_col, date_parser, dayfirst, cache_dates, iterator, chunksize, compre
ssion, thousands, decimal, lineterminator, quotechar, quoting, doublequote, escapechar, comment, encoding, encoding_e
rrors, dialect, error_bad_lines, warn_bad_lines, on_bad_lines, delim_whitespace, low_memory, memory_map, float_precis
ion, storage_options)
 935 kwds_defaults = _refine_defaults_read(
 936 dialect,
 937 delimiter,
 (...)
 946 defaults={"delimiter": ","},
 947 )
 948 kwds.update(kwds_defaults)
--> 950 return _read(filepath_or_buffer, kwds)
File ~\anaconda3\Lib\site-packages\pandas\io\parsers\readers.py:605, in _read(filepath_or_buffer, kwds)
11/5/23, 10:13 AM NaiveBayesian - Jupyter Notebook
localhost:8888/notebooks/Untitled Folder 2/NaiveBayesian.ipynb 4/7
 602 _validate_names(kwds.get("names", None))
 604 # Create the parser.
--> 605 parser = TextFileReader(filepath_or_buffer, **kwds)
 607 if chunksize or iterator:
 608 return parser
File ~\anaconda3\Lib\site-packages\pandas\io\parsers\readers.py:1442, in TextFileReader.__init__(self, f, engine, **k
wds)
 1439 self.options["has_index_names"] = kwds["has_index_names"]
 1441 self.handles: IOHandles | None = None
-> 1442 self._engine = self._make_engine(f, self.engine)
File ~\anaconda3\Lib\site-packages\pandas\io\parsers\readers.py:1735, in TextFileReader._make_engine(self, f, engine)
 1733 if "b" not in mode:
 1734 mode += "b"
-> 1735 self.handles = get_handle(
 1736 f,
 1737 mode,
 1738 encoding=self.options.get("encoding", None),
 1739 compression=self.options.get("compression", None),
 1740 memory_map=self.options.get("memory_map", False),
 1741 is_text=is_text,
 1742 errors=self.options.get("encoding_errors", "strict"),
 1743 storage_options=self.options.get("storage_options", None),
 1744 )
 1745 assert self.handles is not None
 1746 f = self.handles.handle
File ~\anaconda3\Lib\site-packages\pandas\io\common.py:856, in get_handle(path_or_buf, mode, encoding, compression, m
emory_map, is_text, errors, storage_options)
 851 elif isinstance(handle, str):
 852 # Check whether the filename is to be opened in binary mode.
 853 # Binary mode does not support 'encoding' and 'newline'.
 854 if ioargs.encoding and "b" not in ioargs.mode:
 855 # Encoding
--> 856 handle = open(
 857 handle,
 858 ioargs.mode,
 859 encoding=ioargs.encoding,
 860 errors=errors,
 861 newline="",
 862 )
11/5/23, 10:13 AM NaiveBayesian - Jupyter Notebook
localhost:8888/notebooks/Untitled Folder 2/NaiveBayesian.ipynb 5/7
In [15]:
In [16]:
 863 else:
 864 # Binary mode
 865 handle = open(handle, ioargs.mode)
FileNotFoundError: [Errno 2] No such file or directory: 'tennisdata.csv'
The First 5 values of the train data is
 Outlook Temperature Humidity Windy
0 Sunny Hot High Weak
1 Sunny Hot High Strong
2 Overcast Hot High Weak
3 Rain Mild High Weak
4 Rain Cool Normal Weak
The First 5 values of train output is
0 No
1 No
2 Yes
3 Yes
4 Yes
Name: PlayTennis, dtype: object
# obtain train data and train output
X = data.iloc[:, :-1]
print("\nThe First 5 values of the train data is\n", X.head())
y = data.iloc[:, -1]
print("\nThe First 5 values of train output is\n", y.head())
11/5/23, 10:13 AM NaiveBayesian - Jupyter Notebook
localhost:8888/notebooks/Untitled Folder 2/NaiveBayesian.ipynb 6/7
In [17]:
Now the Train output is
 Outlook Temperature Humidity Windy
0 2 1 0 1
1 2 1 0 0
2 0 1 0 1
3 1 2 0 1
4 1 0 1 1
C:\Users\Ashishvajpayee\AppData\Local\Programs\Python\Python310\lib\site-packages\pandas\core\generic.py:5516: Settin
gWithCopyWarning:
A value is trying to be set on a copy of a slice from a DataFrame.
Try using .loc[row_indexer,col_indexer] = value instead
See the caveats in the documentation: https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#returning
-a-view-versus-a-copy (https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#returning-a-view-versusa-copy)
self[name] = value
# convert them in numbers
le_outlook = LabelEncoder()
X.Outlook = le_outlook.fit_transform(X.Outlook)
le_Temperature = LabelEncoder()
X.Temperature = le_Temperature.fit_transform(X.Temperature)
le_Humidity = LabelEncoder()
X.Humidity = le_Humidity.fit_transform(X.Humidity)
le_Windy = LabelEncoder()
X.Windy = le_Windy.fit_transform(X.Windy)
print("\nNow the Train output is\n", X.head())
Now the Train output is
 Outlook Temperature Humidity Windy
0 2 1 0 1
1 2 1 0 0
2 0 1 0 1
3 1 2 0 1
4 1 0 1 1
