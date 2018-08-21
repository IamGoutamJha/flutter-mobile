import 'package:invoiceninja_flutter/redux/app/app_actions.dart';
import 'package:invoiceninja_flutter/redux/client/client_reducer.dart';
import 'package:invoiceninja_flutter/redux/company/company_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/ui_actions.dart';
import 'package:invoiceninja_flutter/redux/ui/ui_state.dart';
import 'package:invoiceninja_flutter/redux/product/product_reducer.dart';
import 'package:invoiceninja_flutter/redux/invoice/invoice_reducer.dart';
import 'package:redux/redux.dart';
// STARTER: import - do not remove comment

UIState uiReducer(UIState state, dynamic action) {
  return state.rebuild((b) => b
    ..filter = filterReducer(state.filter, action)
    ..selectedCompanyIndex = selectedCompanyIndexReducer(state.selectedCompanyIndex, action)
    ..currentRoute = currentRouteReducer(state.currentRoute, action)
    ..enableDarkMode = darkModeReducer(state.enableDarkMode, action)
    ..productUIState.replace(productUIReducer(state.productUIState, action))
    ..clientUIState.replace(clientUIReducer(state.clientUIState, action))
    ..invoiceUIState.replace(invoiceUIReducer(state.invoiceUIState, action))
    // STARTER: reducer - do not remove comment
  );
}

Reducer<String> filterReducer = combineReducers([
  TypedReducer<String, FilterCompany>(updateFilter),
]);

String updateFilter(String filter, FilterCompany action) {
  return action.filter;
}

Reducer<bool> darkModeReducer = combineReducers([
  TypedReducer<bool, UserSettingsChanged>(updateDarkModeReducer),
]);

bool updateDarkModeReducer(bool enableDarkMode, UserSettingsChanged action) {
  return action.enableDarkMode;
}

Reducer<String> currentRouteReducer = combineReducers([
  TypedReducer<String, UpdateCurrentRoute>(updateCurrentRouteReducer),
]);

String updateCurrentRouteReducer(String currentRoute, UpdateCurrentRoute action) {
  return action.route;
}

Reducer<int> selectedCompanyIndexReducer = combineReducers([
  TypedReducer<int, SelectCompany>(selectCompanyReducer),
]);

int selectCompanyReducer(int selectedCompanyIndex, SelectCompany action) {
  return action.companyIndex;
}