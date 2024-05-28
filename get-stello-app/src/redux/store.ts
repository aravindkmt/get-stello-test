import { configureStore } from '@reduxjs/toolkit';
import organisationReducer from './reducer/organisationReducer';

export const store = configureStore({
    reducer: {
        organisation: organisationReducer,
    },
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;