resource "databricks_job" "job1" {
  name = "job1"
  run_as {
    user_name = "p09k91a0227@outlook.com"
  }

  job_cluster {
    job_cluster_key = "job1_cluster"

    new_cluster {
      spark_version      = "13.3.x-scala2.12"
      node_type_id       = "Standard_D4s_v3"
    }
  }

  task {
    task_key        = "t1"
    job_cluster_key = "job1_cluster"

    notebook_task {
      notebook_path = "/Workspace/Users/p09k91a0227@outlook.com/t1"
    }
  }

  task {
    task_key        = "t2"
    job_cluster_key = "job1_cluster"

    depends_on {
      task_key = "t1"
    }

    notebook_task {
      notebook_path = "/Workspace/Users/p09k91a0227@outlook.com/t2"
    }
  }
}
