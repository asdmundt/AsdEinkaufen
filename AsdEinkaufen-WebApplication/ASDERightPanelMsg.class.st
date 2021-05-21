Class {
	#name : #ASDERightPanelMsg,
	#superclass : #WAComponent,
	#category : #'AsdEinkaufen-WebApplication-Components'
}

{ #category : #rendering }
ASDERightPanelMsg >> renderContentOn: html [
	html div
		id: #msgPanel;
		with: [ self renderTabsOn: html ]
]

{ #category : #rendering }
ASDERightPanelMsg >> renderTabsOn: html [
	html
		render:
			(MDLTabWidget new
				addTabNamed: 'Tab 1' content: 'First tab';
				addTabNamed: 'Tab 2' content: 'Second tab';
				yourself)
]
