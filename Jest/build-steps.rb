require 'xcodeproj'
File.open('xcode_custom_steps', 'w') { |file|
    project_path = 'ios/AwesomeProject.xcodeproj'
    project = Xcodeproj::Project.open(project_path)
    project.targets.each do |target|
        target.build_phases.each do |phase|

            if phase.respond_to?(:shell_script)
                file.puts 'Target: ' + target.name
                file.puts 'Phase: ' + phase.display_name
                file.puts '### Start Script ###'
                file.puts phase.shell_script
                file.puts '### End Script ###'
                file.puts ' '
                file.puts ' '
            end
        end
    end
}
