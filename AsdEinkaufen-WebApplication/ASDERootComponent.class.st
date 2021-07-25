"
Description
--------------------

I am the root component of AsdEinkaufenBackend. I will contain every components of the application to display.

I have a header and a footer.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	componentInstances:			<aDictionary>	A dictionary keeping for each component class, an instance. This instance can be use when the user change of page to come pack to a previous page.
	componentToDisplay:		<aComponent>	The current page to display as the root content.
	footer:						<aComponent>	The footer of the page.
	header:						<aComponent>	The header of the page.

"
Class {
	#name : #ASDERootComponent,
	#superclass : #ASDEComponent,
	#traits : 'TRootDialogRenderer',
	#classTraits : 'TRootDialogRenderer classTrait',
	#instVars : [
		'header',
		'componentToDisplay',
		'componentInstances',
		'footer'
	],
	#category : #'AsdEinkaufen-WebApplication-Core'
}

{ #category : #testing }
ASDERootComponent class >> canBeRoot [
	^ true
]

{ #category : #accessing }
ASDERootComponent class >> development [
	^ true
]

{ #category : #initialization }
ASDERootComponent class >> initialize [
	self environment
		at: #WADevelopmentConfiguration
		ifPresent: [ :class | WAAdmin applicationDefaults removeParent: class instance ].	"Remove development tools."
	^ (WAAdmin register: self asApplicationAt: 'EinkaufenInFrankfurt')
		preferenceAt: #sessionClass put: ASDESession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDevelopmentLibrary;
		addLibrary: TMCEFileLibrary;
		addLibrary: ASDELibrary;
		addLibrary: MDLLibrary;
		
		yourself
]

{ #category : #'world menu' }
ASDERootComponent class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'AsdEinkaufenBackend')
		order: 20;
		with: [ (aBuilder item: #'Open in default browser')
				order: 2;
				iconName: #nautilus;
				help: 'Open in the default web browser';
				action: [ self open ] ]
]

{ #category : #'instance creation' }
ASDERootComponent class >> open [
	<script>
	| port |
	WAServerManager default adaptors
		ifEmpty: [ (ZnZincServerAdaptor port: (port := 8085)) start ]
		ifNotEmpty: [ :adaptors | 
			adaptors
				detect: #isRunning
				ifFound: [ :anAdaptor | port := anAdaptor server port ]
				ifNone: [ (ZnZincServerAdaptor port: (port := 8085)) start ] ].
	WebBrowser openOn: 'http://localhost:' , port asString , '/AsdEinkaufenBackend'
]

{ #category : #hooks }
ASDERootComponent >> children [
	^ { self header. self componentToDisplay. self footer }
]

{ #category : #accessing }
ASDERootComponent >> componentInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ componentInstances
]

{ #category : #accessing }
ASDERootComponent >> componentInstances: aDictionary [
	componentInstances := aDictionary
]

{ #category : #accessing }
ASDERootComponent >> componentToDisplay [
	"Component instance to display in the application."
	
	^ componentToDisplay
]

{ #category : #accessing }
ASDERootComponent >> componentToDisplay: aComponent [
	componentToDisplay := aComponent
]

{ #category : #components }
ASDERootComponent >> defaultFooter [
	^ ASDEFooter new
]

{ #category : #components }
ASDERootComponent >> defaultHeader [
	^ ASDEHeader new
]

{ #category : #accessing }
ASDERootComponent >> development [ 
^self class development 
]

{ #category : #updating }
ASDERootComponent >> displayInstanceOf: aComponentClass [
	self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])
]

{ #category : #accessing }
ASDERootComponent >> footer [
	^ footer
]

{ #category : #accessing }
ASDERootComponent >> footer: aComponent [
	footer := aComponent
]

{ #category : #actions }
ASDERootComponent >> goToLoginView [
	self displayInstanceOf: ASDELoginPage
]

{ #category : #actions }
ASDERootComponent >> goToOverviewView [
	self displayInstanceOf: ASDEHomePage 
]

{ #category : #actions }
ASDERootComponent >> goToShopAdminView [
	self displayInstanceOf: ASDEAdminShopPage 
]

{ #category : #actions }
ASDERootComponent >> goToShopOwnerView [
	self displayInstanceOf: ASDEShopOwnerPageOverview
]

{ #category : #accessing }
ASDERootComponent >> header [
	^ header
]

{ #category : #accessing }
ASDERootComponent >> header: aComponent [
	header := aComponent
]

{ #category : #hooks }
ASDERootComponent >> initialRequest: aRequest [
	| consumer pageName |
	super initialRequest: aRequest.
	consumer := self requestContext consumer.
	
	"If we are at end, nothing to manage"
	consumer atEnd ifTrue: [ ^ self ].
	
	pageName := consumer peek asLowercase. "Do not make URLs case sensitive in that case"
	
	"Try to find a page corresponding"
	self header possiblePages
		detect: [ :each | each pathName asLowercase = pageName ]
		ifFound: [ :class | 
			self displayInstanceOf: class.

			"If we find a page, we pop the subpart of the path corresponding to the page."
			consumer next ]
]

{ #category : #initialization }
ASDERootComponent >> initialize [
	super initialize.
	self header: self defaultHeader.
	self footer: self defaultFooter.
	self session rootComponent: self.
	self componentInstances: Dictionary new.
	self displayInstanceOf: self header possiblePages first
]

{ #category : #rendering }
ASDERootComponent >> renderContentOn: html [
	| size |
	self session isLogged
		ifTrue: [ size := 8 ]
		ifFalse: [ size := 12 ].
	html
		mdlLayout: [ html render: self header.
			html mdlLayoutContent
				class: 'mdl-color-text--grey-600';
				with: [ html mdlGrid
						noSpacing;
						style: 'height: 100%; ';
						with: [ html mdlCell
								stretch;
								size: size;
								with: [ html render: self componentToDisplay ].
								self session isLogged
										ifTrue: [html mdlCell
								stretch;
								size: 4;
								with: [ html render: self componentToDisplay ]. ]].
					html render: self footer ] ].
	self renderEmptyGenericDialogOn: html
]

{ #category : #rendering }
ASDERootComponent >> renderRightPanel: html [
	html div
		shadow: 2;
		style: 'height: 700px; display: flex; with: 300px; padding:15px';
		with: ASDEComponentWithRightPanel new
]

{ #category : #actions }
ASDERootComponent >> tryConnectionWithLogin: login andPassword: password [
	| user |
	user := self session model userFromLogin: login andPassword: password.
	"self halt."
	user
		ifNotNil: [ :arg | 
			arg logged: true.
			self session currentUser: arg.
			self session userId: arg id.
			"arg logged: true."
			self session model addLoggedUser: arg.
			arg isAdmin
				ifTrue: [ self goToShopAdminView ]
				ifFalse: [ self goToOverviewView ] ]
		ifNil: [ self session loginError.
			self goToLoginView ]
]

{ #category : #updating }
ASDERootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Einkaufen in Frankfurt'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'
]

{ #category : #updating }
ASDERootComponent >> updateUrl: aUrl [
	super updateUrl: aUrl.
	aUrl addToPath: (self componentToDisplay pathName)
]
