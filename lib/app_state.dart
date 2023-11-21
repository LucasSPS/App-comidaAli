import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _tempImagesPath =
          prefs.getStringList('ff_tempImagesPath') ?? _tempImagesPath;
    });
    _safeInit(() {
      _logoimage = prefs.getString('ff_logoimage') ?? _logoimage;
    });
    _safeInit(() {
      _categories = prefs.getStringList('ff_categories') ?? _categories;
    });
    _safeInit(() {
      _boolFilteredAds =
          prefs.getBool('ff_boolFilteredAds') ?? _boolFilteredAds;
    });
    _safeInit(() {
      _boolSearchAds = prefs.getBool('ff_boolSearchAds') ?? _boolSearchAds;
    });
    _safeInit(() {
      _boolDefaultAds = prefs.getBool('ff_boolDefaultAds') ?? _boolDefaultAds;
    });
    _safeInit(() {
      _filterAdType = prefs.getString('ff_filterAdType') ?? _filterAdType;
    });
    _safeInit(() {
      _filterSortBy = prefs.getString('ff_filterSortBy') ?? _filterSortBy;
    });
    _safeInit(() {
      _filterCategoriesSelected =
          prefs.getStringList('ff_filterCategoriesSelected') ??
              _filterCategoriesSelected;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _tempImagesPath = [];
  List<String> get tempImagesPath => _tempImagesPath;
  set tempImagesPath(List<String> _value) {
    _tempImagesPath = _value;
    prefs.setStringList('ff_tempImagesPath', _value);
  }

  void addToTempImagesPath(String _value) {
    _tempImagesPath.add(_value);
    prefs.setStringList('ff_tempImagesPath', _tempImagesPath);
  }

  void removeFromTempImagesPath(String _value) {
    _tempImagesPath.remove(_value);
    prefs.setStringList('ff_tempImagesPath', _tempImagesPath);
  }

  void removeAtIndexFromTempImagesPath(int _index) {
    _tempImagesPath.removeAt(_index);
    prefs.setStringList('ff_tempImagesPath', _tempImagesPath);
  }

  void updateTempImagesPathAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _tempImagesPath[_index] = updateFn(_tempImagesPath[_index]);
    prefs.setStringList('ff_tempImagesPath', _tempImagesPath);
  }

  void insertAtIndexInTempImagesPath(int _index, String _value) {
    _tempImagesPath.insert(_index, _value);
    prefs.setStringList('ff_tempImagesPath', _tempImagesPath);
  }

  LatLng? _endereco = LatLng(-22.8303249, -43.392192);
  LatLng? get endereco => _endereco;
  set endereco(LatLng? _value) {
    _endereco = _value;
  }

  String _logoimage = '';
  String get logoimage => _logoimage;
  set logoimage(String _value) {
    _logoimage = _value;
    prefs.setString('ff_logoimage', _value);
  }

  List<String> _categories = [
    'Padaria e Confeitaria',
    'Açougue',
    'Peixaria',
    'Cereais',
    'Frios e Laticínios',
    'Bebidas não alcoolicas',
    'Legumes',
    'Frutas',
    'Enlatados e Conservas',
    'Bomboniere',
    'Verduras',
    'Alimentos Prontos',
    'Massas'
  ];
  List<String> get categories => _categories;
  set categories(List<String> _value) {
    _categories = _value;
    prefs.setStringList('ff_categories', _value);
  }

  void addToCategories(String _value) {
    _categories.add(_value);
    prefs.setStringList('ff_categories', _categories);
  }

  void removeFromCategories(String _value) {
    _categories.remove(_value);
    prefs.setStringList('ff_categories', _categories);
  }

  void removeAtIndexFromCategories(int _index) {
    _categories.removeAt(_index);
    prefs.setStringList('ff_categories', _categories);
  }

  void updateCategoriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _categories[_index] = updateFn(_categories[_index]);
    prefs.setStringList('ff_categories', _categories);
  }

  void insertAtIndexInCategories(int _index, String _value) {
    _categories.insert(_index, _value);
    prefs.setStringList('ff_categories', _categories);
  }

  String _userphoto = '';
  String get userphoto => _userphoto;
  set userphoto(String _value) {
    _userphoto = _value;
  }

  bool _boolFilteredAds = false;
  bool get boolFilteredAds => _boolFilteredAds;
  set boolFilteredAds(bool _value) {
    _boolFilteredAds = _value;
    prefs.setBool('ff_boolFilteredAds', _value);
  }

  bool _boolSearchAds = false;
  bool get boolSearchAds => _boolSearchAds;
  set boolSearchAds(bool _value) {
    _boolSearchAds = _value;
    prefs.setBool('ff_boolSearchAds', _value);
  }

  bool _boolDefaultAds = true;
  bool get boolDefaultAds => _boolDefaultAds;
  set boolDefaultAds(bool _value) {
    _boolDefaultAds = _value;
    prefs.setBool('ff_boolDefaultAds', _value);
  }

  String _filterAdType = 'Todos';
  String get filterAdType => _filterAdType;
  set filterAdType(String _value) {
    _filterAdType = _value;
    prefs.setString('ff_filterAdType', _value);
  }

  String _filterSortBy = 'Novidades';
  String get filterSortBy => _filterSortBy;
  set filterSortBy(String _value) {
    _filterSortBy = _value;
    prefs.setString('ff_filterSortBy', _value);
  }

  List<String> _filterCategoriesSelected = [];
  List<String> get filterCategoriesSelected => _filterCategoriesSelected;
  set filterCategoriesSelected(List<String> _value) {
    _filterCategoriesSelected = _value;
    prefs.setStringList('ff_filterCategoriesSelected', _value);
  }

  void addToFilterCategoriesSelected(String _value) {
    _filterCategoriesSelected.add(_value);
    prefs.setStringList(
        'ff_filterCategoriesSelected', _filterCategoriesSelected);
  }

  void removeFromFilterCategoriesSelected(String _value) {
    _filterCategoriesSelected.remove(_value);
    prefs.setStringList(
        'ff_filterCategoriesSelected', _filterCategoriesSelected);
  }

  void removeAtIndexFromFilterCategoriesSelected(int _index) {
    _filterCategoriesSelected.removeAt(_index);
    prefs.setStringList(
        'ff_filterCategoriesSelected', _filterCategoriesSelected);
  }

  void updateFilterCategoriesSelectedAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _filterCategoriesSelected[_index] =
        updateFn(_filterCategoriesSelected[_index]);
    prefs.setStringList(
        'ff_filterCategoriesSelected', _filterCategoriesSelected);
  }

  void insertAtIndexInFilterCategoriesSelected(int _index, String _value) {
    _filterCategoriesSelected.insert(_index, _value);
    prefs.setStringList(
        'ff_filterCategoriesSelected', _filterCategoriesSelected);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
