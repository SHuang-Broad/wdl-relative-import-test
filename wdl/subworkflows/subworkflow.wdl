version 1.0

import "tasks/tasks.wdl" as worker
import "../utils/utils.wdl" as utilities

workflow ChildWorkflow {

	input {
		String msg_to_pass_on
	}

	call utilities.SubworkflowUtil as util { input: msg = msg_to_pass_on }

	call worker.LeafNode as leaf { input: to_be_formatted = util.pass_on_msg }

	output {
		File formatted_msg = leaf.formatted_msg
	}
}