
import { createReducer, on } from '@ngrx/store';
import { UserDetail } from 'src/app/models/user/userDetail';
import { setUserDetail, deleteUserDetail } from './auth.actions';


export interface AuthState {
  userDetail?: UserDetail;
}

const initialAuthState: AuthState = {
  userDetail: undefined
};

export const AuthReducer = createReducer(
  initialAuthState,
  on(setUserDetail, (state: AuthState, { userDetail }) => ({
    ...state,
    userDetail: userDetail
  })),
  on(deleteUserDetail, (state: AuthState, { }) => ({
    ...state,
    userDetail: undefined
  }))

)

