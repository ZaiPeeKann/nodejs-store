import Admin from "./pages/Admin";
import Basket from "./pages/Basket"
import Shop from "./pages/Shop";
import Device from "./pages/Device";
import Auth from "./pages/Auth";

export const authRoutes = [
	{path: '/admin', component: <Admin/>},
	{path: '/basket', component: <Basket/>}
];

export const publicRoutes = [
	{path: '/', component: <Shop/>},
	{path: '/device/:id', component: <Device/>},
	{path: '/registration', component: <Auth/>},
	{path: '/login', component: <Auth/>}
];