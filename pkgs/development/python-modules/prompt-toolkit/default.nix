{ lib
, buildPythonPackage
, fetchPypi
, pytestCheckHook
, pythonOlder
, wcwidth
}:

buildPythonPackage rec {
  pname = "prompt-toolkit";
  version = "3.0.28";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    pname = "prompt_toolkit";
    inherit version;
    sha256 = "sha256-nxzRax6GwpaPJRnX+zHdnWaZFvUVYSwmnRTp7VK1FlA=";
  };

  propagatedBuildInputs = [
    wcwidth
  ];

  checkInputs = [
    pytestCheckHook
  ];

  disabledTests = [
    "test_pathcompleter_can_expanduser"
  ];

  pythonImportsCheck = [
    "prompt_toolkit"
  ];

  meta = with lib; {
    description = "Python library for building powerful interactive command lines";
    longDescription = ''
      prompt_toolkit could be a replacement for readline, but it can be
      much more than that. It is cross-platform, everything that you build
      with it should run fine on both Unix and Windows systems. Also ships
      with a nice interactive Python shell (called ptpython) built on top.
    '';
    homepage = "https://github.com/jonathanslenders/python-prompt-toolkit";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ];
  };
}
