# Planning Strat

1. Create Setup for Plugin to Init 
    - make arg in setup function that requires a path to engine dir - 3 tests
    - Create command that calls the build
:
2. Build with the Unreal engine in NeoVim
    - check path, determine if multiple engines exist
    - if multiple prompt user to pick one
    - if only one then choose that
    - check current project path - user MUST be in root of project for this build
    - build project
