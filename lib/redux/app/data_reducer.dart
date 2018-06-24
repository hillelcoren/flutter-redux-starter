import 'package:flutter_redux_starter/redux/app/data_state.dart';

// STARTER: import [do not remove comment]

DataState dataReducer(DataState state, action) {

  return state.rebuild((b) => b
    // STARTER: reducer [do not remove comment]
    //..invoiceState.replace(invoicesReducer(state.invoiceState, action))
  );
}

