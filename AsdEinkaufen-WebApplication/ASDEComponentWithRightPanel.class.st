Class {
	#name : #ASDEComponentWithRightPanel,
	#superclass : #WAComponent,
	#traits : 'TASDRightTabsPanelBrowser',
	#classTraits : 'TASDRightTabsPanelBrowser classTrait',
	#instVars : [
		'toolbar',
		'rightPanel'
	],
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #accessing }
ASDEComponentWithRightPanel >> browserClass [
	"I should return an html class specific to the browser to prefix generated ids and classes for the HTML."

	^ 'rightPanel'
]

{ #category : #components }
ASDEComponentWithRightPanel >> defaultFoldButton [
	^ (MDLFoldButton for: '#' , self rightPanelId)
	fold;
	yourself 
]

{ #category : #components }
ASDEComponentWithRightPanel >> defaultToolbar [
	^ MDLVerticalToolbar
		buttons:
			{self defaultFoldButton.
			}
]

{ #category : #initialization }
ASDEComponentWithRightPanel >> initialize [
	super initialize.
	self initializeRightPanel
]

{ #category : #rendering }
ASDEComponentWithRightPanel >> renderContentOn: html [
	html div style: 'flex-grow: 1;'.
	self renderRightPanelOn: html
]

{ #category : #accessing }
ASDEComponentWithRightPanel >> rightPanel [
	^ rightPanel
]

{ #category : #accessing }
ASDEComponentWithRightPanel >> rightPanel: aComponent [
	rightPanel := aComponent
]

{ #category : #components }
ASDEComponentWithRightPanel >> setDefaultRightPanel [
	self rightPanel: ASDSRightPanelMsg new
]

{ #category : #components }
ASDEComponentWithRightPanel >> setTab2RightPanel [
	self rightPanel: ASDSRightPanelSettings new
]

{ #category : #accessing }
ASDEComponentWithRightPanel >> toolbar [
	^ toolbar
]

{ #category : #accessing }
ASDEComponentWithRightPanel >> toolbar: aComponent [
	toolbar := aComponent
]
