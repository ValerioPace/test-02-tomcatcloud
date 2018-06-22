angular.module('noipa.headerModule').constant('HEADER_CONFIG', {
  "title": "Header",
  "userEndpoint": "http://utente-myproject.192.168.99.100.nip.io/demo/saluti",
  "context": {
    "site": {
      "name": "NoiPa",
      "subtitle": "",
      "backMessage": "< Torna all'area pubblica",
      "logo": "//placehold.it/75x80"
    }
  },
  "isFixed": true,
  "variants": [
    {
      "name": "default",
      "context": {
        "clone": false
      }
    },
    {
      "name": "monochrome",
      "context": {
        "backgroundClassName": "u-background-50",
        "menu": true,
        "megamenu": true
      }
    },
    {
      "name": "menu",
      "context": {
        "menu": true
      }
    },
    {
      "name": "megamenu",
      "context": {
        "menu": true,
        "megamenu": true
      }
    },
    {
      "name": "comune",
      "context": {
        "menu": true,
        "megamenu": true,
        "site": {
          "name": "Nome del comune",
          "subtitle": "",
          "owner": "Nome Regione"
        }
      }
    }
  ]
});