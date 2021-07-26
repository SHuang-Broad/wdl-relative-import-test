version 1.0


import "subworkflows/subworkflow.wdl" as first_branching
import "utils/utils.wdl" as utilities

workflow End2EndWorkflow {

	input {
		String name
		String age
	}


	call utilities.OverallUtil as workflow_util { input: a = name, b = age}

	call first_branching.ChildWorkflow as first_generation_children {input: msg_to_pass_on = workflow_util.msg }

	output {
		File final_message = first_generation_children.formatted_msg
	}
}