//
//  AQIViewModel.swift
//  ProximityAQI
//
//  Created by SYED FARAN GHANI on 12/12/21.
//

import UIKit
import Network

typealias CityListComplitionHandler = ([City]) -> Void

class CitiesViewModel {
    
    private var webSocket: WebSocket!
    
    var completion : CityListComplitionHandler?
    
    var isBusy: Bindable<Bool> = Bindable(false)
    var cityList: Bindable<[City]?> = Bindable(nil)
    var error: Bindable<Error?> = Bindable(nil)
    
    init(socket: WebSocket? = nil) {
        self.webSocket = socket ?? WebSocket(url: URL(string: .kCityAQIUrl)!)
    }
    
    func getCityWiseAQI(completion:  @escaping ([City]) -> Void) {
        isBusy.value = true
                
        webSocket.delegate = self
        webSocket.connect()
        self.completion = completion
        
    }
}


extension CitiesViewModel: WebSocketConnectionDelegate{
    func webSocketDidConnect(connection: WebSocketConnection) {
        print("WebSocket did connect")
    }
    
    func websocketDidPrepare(connection: WebSocketConnection) {
        print("WebSocket did prepare")
    }
    
    func webSocketDidDisconnect(connection: WebSocketConnection, closeCode: NWProtocolWebSocket.CloseCode, reason: Data?) {
        print("WebSocket did disconnect")
    }
    
    func websocketDidCancel(connection: WebSocketConnection) {
        print("WebSocket did cancel")
    }
    
    func webSocketDidReceiveError(connection: WebSocketConnection, error: Error) {
        print("WebSocket did receive error: \(error)")
    }
    
    func webSocketDidReceivePong(connection: WebSocketConnection) {
        print("WebSocket did receive pong")
    }
    
    func webSocketDidReceiveMessage(connection: WebSocketConnection, string: String) {
        print("WebSocket did receive string message: \(string)")
        self.cityList.value = [City]()
        
        self.isBusy.value = false

        do {
            
            if let json = string.data(using: .utf8){
                
                let jsonResult = try JSONDecoder().decode([City].self, from: json)
                
                self.cityList.value = jsonResult
                Log.info("city list fetch successfull.")
                self.completion!(self.cityList.value!)

                }

        } catch {
            Log.error("Unable to decode", error: error)
        }
    }
    
    func webSocketDidReceiveMessage(connection: WebSocketConnection, data: Data) {
        print("WebSocket did receive data message")
        
        
    }
    
}
