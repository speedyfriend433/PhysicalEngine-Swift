import SwiftUI

struct ContentView: View {
    @ObservedObject var physicsEngine = PhysicsEngine()
    
    var body: some View {
        ZStack {
            ForEach(physicsEngine.objects) { object in
                Circle()
                    .fill(Color.blue)
                    .frame(width: object.radius * 2, height: object.radius * 2)
                    .position(object.position)
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            physicsEngine.startSimulation()
        }
        .onDisappear {
            physicsEngine.stopSimulation()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
