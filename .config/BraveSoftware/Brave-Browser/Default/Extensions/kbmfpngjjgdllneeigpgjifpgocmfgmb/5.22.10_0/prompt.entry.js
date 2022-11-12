/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// CONCATENATED MODULE: ./lib/environment/utils/api.js
function apiToPromise(func) {
  return (...args) => new Promise((resolve, reject) => {
    func(...args, (...results) => {
      if (chrome.runtime.lastError) {
        reject(new Error(chrome.runtime.lastError.message));
      } else {
        resolve(results.length > 1 ? results : results[0]);
      }
    });
  });
}
// CONCATENATED MODULE: ./lib/environment/utils/messaging.js
class MessageHandlerError extends Error {
  constructor(message, stack) {
    super();
    this.message = message;
    this.stack = stack;
  }

}

function createMessageHandler(_sendMessage, errorOnUnrecognizedTypes = false) {
  const listeners = new Map();
  return {
    _handleMessage: function ({
      type,
      data
    }, sendResponse, context) {
      const listener = listeners.get(type);

      if (!listener) {
        if (errorOnUnrecognizedTypes) {
          sendResponse({
            error: {
              message: `Unrecognised message type: ${type}`,
              stack: ''
            }
          });
        }

        return false;
      }

      let response;

      try {
        response = listener(data, context);
      } catch (e) {
        console.error(e);
        sendResponse({
          error: {
            message: e.message,
            stack: e.stack
          }
        });
        return false;
      }

      if (response instanceof Promise) {
        response.then(data => sendResponse({
          data
        }), e => {
          console.error(e);
          sendResponse({
            error: {
              message: e.message,
              stack: e.stack
            }
          });
        });
        return true;
      } else {
        sendResponse({
          data: response
        });
        return false;
      }
    },
    sendMessage: async function (type, data, context) {
      const {
        data: newData,
        error
      } = await _sendMessage({
        type,
        data
      }, context);

      if (error) {
        throw new MessageHandlerError(error.message, `${error.stack}\n    at target's "${type}" handler`);
      } else {
        return newData;
      }
    },
    addListener: function (type, callback) {
      if (listeners.has(type)) {
        throw new Error(`Listener for "${type}" already exists.`);
      }

      listeners.set(type, callback);
    }
  };
}
// CONCATENATED MODULE: ./lib/environment/background/messaging.js



const _sendMessage = apiToPromise(chrome.tabs.sendMessage);

const {
  _handleMessage,
  sendMessage,
  addListener
} = createMessageHandler((obj, tabId) => _sendMessage(tabId, obj));
chrome.runtime.onMessage.addListener((obj, sender, sendResponse) => _handleMessage(obj, sendResponse, sender));

// CONCATENATED MODULE: ./lib/environment/background/permissions.js


addListener('permissions', handleMessage);
function handleMessage({
  operation,
  permissions,
  origins
}) {
  switch (operation) {
    case 'contains':
      return apiToPromise(chrome.permissions.contains)({
        permissions,
        origins
      });

    case 'request':
      return apiToPromise(chrome.permissions.request)({
        permissions,
        origins
      }).catch(() => makePromptWindow({
        permissions,
        origins
      }));

    default:
      throw new Error(`Invalid permissions operation: ${operation}`);
  }
}

async function makePromptWindow({
  permissions,
  origins
}) {
  const url = new URL('prompt.html', location.origin);
  url.searchParams.set('permissions', JSON.stringify(permissions));
  url.searchParams.set('origins', JSON.stringify(origins));
  const width = 630;
  const height = 255;
  const left = Math.floor(screen.width / 2 - width / 2);
  const top = Math.floor(screen.height / 2 - height / 2);
  const {
    tabs: [{
      id
    }]
  } = await apiToPromise(chrome.windows.create)({
    url: url.href,
    type: 'popup',
    width,
    height,
    left,
    top
  });
  return new Promise(resolve => {
    function updateListener(tabId, updates) {
      if (tabId !== id) return;
      const url = updates.url && new URL(updates.url);

      if (url && url.searchParams.has('result')) {
        stopListening();
        const result = url.searchParams.get('result');
        if (!result) return;
        resolve(JSON.parse(result));
        apiToPromise(chrome.tabs.remove)(id);
      }
    }

    function removeListener(tabId) {
      if (tabId !== id) return;
      stopListening();
      resolve(false);
    }

    function stopListening() {
      chrome.tabs.onUpdated.removeListener(updateListener);
      chrome.tabs.onRemoved.removeListener(removeListener);
    }

    chrome.tabs.onUpdated.addListener(updateListener);
    chrome.tabs.onRemoved.addListener(removeListener);
  });
}
// CONCATENATED MODULE: ./node_modules/babel-loader/lib??ref--5-0!./lib/environment/background/permissions/prompt.entry.js

const prompt_entry_url = new URL(location.href);
const prompt_entry_button = document.body.querySelector('#request');
prompt_entry_button.addEventListener('click', async () => {
  try {
    const result = await handleMessage({
      operation: 'request',
      permissions: JSON.parse(prompt_entry_url.searchParams.get('permissions') || '[]'),
      origins: JSON.parse(prompt_entry_url.searchParams.get('origins') || '[]')
    });
    prompt_entry_url.searchParams.set('result', JSON.stringify(result));
    location.href = prompt_entry_url.href;
  } catch (e) {
    alert(`An error occured: ${e.message}`);
  }
});
prompt_entry_button.focus();

/***/ })
/******/ ]);
//# sourceMappingURL=prompt.entry.js.map