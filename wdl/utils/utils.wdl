version 1.0


# inteded to be used by workflows
task OverallUtil {
	input {
		String a
		String b
	}

	command <<<
		echo "~{a} with ~{b}"
	>>>

	output {
		String msg = stdout()
	}

	runtime {
		docker: "ubuntu:latest"
	}

}

# test if importable by individual tasks
task SubworkflowUtil {

	input {
		String msg
	}

	command <<<
		echo "~{msg}"
	>>>

	output {
		String pass_on_msg = stdout()
	}
	runtime {
		docker: "ubuntu:latest"
	}
}