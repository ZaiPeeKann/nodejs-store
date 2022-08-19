import {makeAutoObservable} from "mobx";

export class DeviceStore {
	constructor() {
		makeAutoObservable(this)
		this._types = [
			{id: 1, name: 'Холодильники'},
			{id: 2, name: 'Смартфоны'}
		]
		this._brands = [
			{id: 1, name: 'Apple'},
			{id: 2, name: 'Samsung'}
		]
		this._devices = [
			{id: 1, name: "iPhone 13 pro", typeId: 1, brandId: 1, price: 80000, rating: 0, img: `https://uralcases.ru/product/apple-iphone-13-128-gb-rozovyj-pink/`},
			{id: 2, name: "Galaxy S22", typeId: 1, brandId: 2, price: 70000, rating: 0, img: `https://market.yandex.ru/product--smartfon-samsung-galaxy-s22-sm-s901b/1665508217?sku=101610473789`}
		]
		this._selectedType = {}
		this._selectedBrand = {}
	}

	get types() {
		return this._types
	}

	get brands() {
		return this._brands
	}

	get devices() {
		return this._devices
	}

	get selectedType() {
		return this._selectedType
	}

	get selectedBrand() {
		return this._selectedBrand
	}

	setDevices(devices) {
		this._devices = devices
	}

	setSelectedType(type) {
		this._selectedType = type
	}

	setSelectedBrand(brand) {
		this._selectedType = brand
	}
}