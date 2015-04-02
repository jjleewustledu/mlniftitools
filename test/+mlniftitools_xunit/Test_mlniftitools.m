% TEST_MLNIFTITOOLS performs unit testing of modications to Jimmy Shen's niftitools
%
% Instantiation:
%		runner = mlunit.text_test_runner(1, verbosity); % verbosity has values 0..2
%		loader = mlunit.test_loader;
%		run(runner, load_tests_from_test_case(loader, 'mlniftitools_test.Test_mlniftitools'));
%
% See Also:
%		help text_test_runner
%		http://mlunit.dohmke.de/Main_Page
%		http://mlunit.dohmke.de/Unit_Testing_With_MATLAB
%		thomi@users.sourceforge.net
%
% Created by John Lee on 2009-02-14.
% Copyright (c) 2009 Washington University School of Medicine.  All rights reserved.
% Report bugs to <email="bugs.perfusion.neuroimage.wustl.edu@gmail.com"/>.

classdef Test_mlniftitools < mlunit.test_case
    
    properties
        anMlniftitools = 0;
		testDataFolder = '~/Local/src/mlcvl/mlniftitools/test/testData/';
    end % properties

    methods

        %% CTOR
        function obj = Test_mlniftitools(varargin)
            obj = obj@mlunit.test_case(varargin{:});
        end % ctor

        %% TEST_NULL assures that mlunit.assert functions are working correctly
        function obj = test_null(obj)
            mlunit.assert_equals(0, 0);
        end % function test_null

		%% TEST_LOAD_NII
		function obj = test_load_nii(obj)
			nii = load_nii([obj.testDataFolder 't1_mpr.nii.gz']);
			assert(numel(nii) > 0);
			system(['gzip ' obj.testDataFolder 't1_mpr.nii']);
		end % function test_load_nii
    end % methods
end