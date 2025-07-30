resource "databricks_workspace_file" "t3" {
  source = "/../scripts/t3.py" # Local file
  path   = "/Workspace/Users/p09k91a0227@outlook.com/t3"  # Destination in Workspace
}

resource "databricks_job" "job2" {
  name = "job2"
  run_as {
    user_name = "p09k91a0227@outlook.com"
  }

  job_cluster {
    job_cluster_key = "job2_cluster"

    new_cluster {
      spark_version      = "13.3.x-scala2.12"
      node_type_id       = "Standard_D4s_v3"
    }
  }

  task {
    task_key        = "t3"
    job_cluster_key = "job2_cluster"

    notebook_task {
        notebook_path = "/../scripts/t3.py"
    }
  }

  task {
    task_key        = "t2"
    job_cluster_key = "job2_cluster"

    depends_on {
      task_key = "t3"
    }

    notebook_task {
      notebook_path = "/Workspace/Users/p09k91a0227@outlook.com/t2"
    }
  }
}
