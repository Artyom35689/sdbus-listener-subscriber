#pragma once
#include <sdbus-c++/sdbus-c++.h>
#include <string>

namespace ConfigManager{
    constexpr auto ServiceName = "com.system.configurationManager";
    constexpr auto ObjectPath = "/com/system/configurationManager/Application";
    constexpr auto InterfaceName = "com.system.configurationManager.ApplicationConfiguration";
    constexpr auto ConfigFilePath = "/etc/dbus-config-manager/";

    using Variant = sdbus::Variant;
    using ConfigMap = std::map<std::string, Variant>;
}