version 1.0


# emulating leaf tasks
task LeafNode {

	input {
		String to_be_formatted
	}

	command <<<
		echo -e "If you see me, \n  you are formatted ~{to_be_formatted} \n  at datetime $(date)."
	>>>

	output {
		File formatted_msg = stdout()
	}
	runtime {
		docker: "ubuntu:latest"
	}
}