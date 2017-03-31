resource "aws_iam_role_policy" "container_builder_codepipeline_policy" {
  name = "container_builder_codepipeline_policy"
  role = "${aws_iam_role.container_builder_codepipeline_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
        "Action": [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketVersioning"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "s3:PutObject"
        ],
        "Resource": [
          "arn:aws:s3:::codepipeline*"
        ],
        "Effect": "Allow"
      },
      {
        "Action": [
          "s3:*",
          "ecs:*"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "lambda:InvokeFunction",
          "lambda:ListFunctions"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "codebuild:BatchGetBuilds",
          "codebuild:StartBuild"
        ],
        "Resource": "*",
        "Effect": "Allow"
      }
    ]
  }
EOF
}

resource "aws_iam_policy" "container_builder_codebuild_policy" {
  name        = "container_builder_codebuild_policy"
  path        = "/service-role/"
  description = "Policy used in trust relationship with CodeBuild"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "s3:*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecr:*"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "container_builder_codebuild_policy_attachment" {
  name       = "container_builder_codebuild_policy_attachment"
  policy_arn = "${aws_iam_policy.container_builder_codebuild_policy.arn}"
  roles      = ["${aws_iam_role.container_builder_codebuild_role.id}"]
}
