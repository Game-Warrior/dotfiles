/* I made dis. 2021  edgework@wongo.com */

function hopTheWallWithoutPayingForItBecauseYouDidntWantToPayInTheFirstPlaceDuh() {
	const redir = `https://12ft.io/proxy?q=${encodeURI(window.location)}`;
	window.location = redir;
	
	// Why is that hard and worth $12 a year?  smh
}

chrome.action.onClicked.addListener((tab) => {
	chrome.scripting.executeScript({
    target: { tabId: tab.id },
    function: hopTheWallWithoutPayingForItBecauseYouDidntWantToPayInTheFirstPlaceDuh
  });
});

chrome.contextMenus.create({
	id: "1",
	title: "Open in 12ft.io", 
	contexts:["link"], 
});

chrome.contextMenus.onClicked.addListener((ocd, tab, a ,b, c) => {
	const redir = `https://12ft.io/proxy?q=${encodeURI(ocd.linkUrl)}`;
	chrome.tabs.create({url: redir});
});





