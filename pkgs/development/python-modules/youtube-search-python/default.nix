{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, httpx
}:

buildPythonPackage rec {
  pname = "youtube-search-python";
  version = "1.6.4";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9ZAZaLkJb2mEg0rstBxOvs9/L4wtbLuCTdFDOuxMqN0=";
  };

  propagatedBuildInputs = [
    httpx
  ];

  pythonImportsCheck = [
    "youtubesearchpython"
  ];

  # Project has no tests
  doCheck = false;

  meta = with lib; {
    description = "Search for YouTube videos, channels & playlists & get video information using link without YouTube Data API";
    homepage = "https://github.com/alexmercerind/youtube-search-python";
    license = licenses.mit;
    maintainers = with maintainers; [ marsam ];
  };
}
