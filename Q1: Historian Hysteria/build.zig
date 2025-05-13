const std = @import("std");

pub fn build(build_obj: *std.Build) void 
{   
    //constructs a build struct to store build tree info
    const exec = build_obj.addExecutable(.{
        .name = "historian_histeria",
        .root_source_file = build_obj.path, 
        .target = build_obj.graph.host,
    });

    build_obj.installArtifact(exe);
    //uses the the built object as a execution target

    const run_exe = build_obj.addRunArtifact(exe);
    
    //actual running: the defines a part of the run script through step()
    //the step from run_exe (idk bruv)
    const run_step = build_obj.step("run", "Run the application (hello)");
    run_step.dependOn(&run_exe.step);
}
