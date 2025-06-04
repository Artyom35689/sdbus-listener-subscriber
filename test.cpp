#include <sdbus-c++/sdbus-c++.h>
#include <iostream>

// dbus-launch ./main


int main() {
    try {
        auto connection = sdbus::createSessionBusConnection();
        std::cout << "D-Bus connection established successfully!" << std::endl;
        return 0;
    } catch (const sdbus::Error& e) {
        std::cerr << "D-Bus error: " << e.getName() << " - " << e.getMessage() << std::endl;
        return 1;
    }
}