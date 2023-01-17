const c_op = ['+', '-', '×', '÷'];

class Calculator{
  static var _number = new List();
  static var _op = new List();
  static String _buffer;

  static void getKey(String letter){
    if(c_op.contains(letter)){
      _op.add(letter);
      _number.add(double.parse(_buffer));
      _buffer = '';
    } // C
    else if(letter == 'C'){
      _number.clear();
      _op.clear();
      _buffer = '';
    } // =
    else if(letter == '='){
      return null;
    }// 数字
    else{
      _buffer += letter;
    }
  }
  static double _result;
  static String execute() {
    _number.add(double.parse(_buffer));
    if (_number.length == 0)
      return '0';
    _result = _number[0];
    for (int i = 0; i < _op.length; i++) {
      if (_op[i] == '+')
        _result += _number[i + 1];
      else if (_op[i] == '-')
        _result -= _number[i + 1];
      else if (_op[i] == '×')
        _result *= _number[i + 1];
      else if (_op[i] == '÷' && _number[i + 1] != 0)
        _result /= _number[i + 1];
      else
        return 'e';
    }
    _number.clear();
    _op.clear();
    _buffer = '';
    var resultStr = _result.toString().split('.');
    return resultStr[1] == '0' ? resultStr[0] : _result.toString();
  }
}