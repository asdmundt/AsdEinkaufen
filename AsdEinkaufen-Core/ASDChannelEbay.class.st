Class {
	#name : #ASDChannelEbay,
	#superclass : #ASDChannel,
	#category : #'AsdEinkaufen-Core-Model'
}

{ #category : #initialization }
ASDChannelEbay >> initialize [
	super initialize.
	self	content:( XMLHTMLParser	parse:
			(ZnClient new
				url: 'https://www.conrad.de/';
				formAt: '__cf_bm'
					put:
					'206e7a1e5389df8730647544a517a8c3e40e6009-1625838553-1800-ASUP5pgsaXYcBgMH/MZfHoL7AGCz4isBGlJkUOkUQeEe0egek4ddvM3u9ofiz4f8/goh/bc+TPsunwpwKIpmXU0=';
				post;
				get: 'https://www.conrad.de/'))
]
