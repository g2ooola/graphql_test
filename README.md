# README

## Query
相關語法 [REF](https://graphql.org/learn/queries/)

### Fragments
把 graphql 的部分語法抽出來重複使用，類似 function 的概念
原本
```graphql
query {
  project {
    id
    name
  }
}
```
變成
```language
query {
  project {
    ...projectInfo
  }
}

fragment projectInfo on Project {
  name
  id
}
```

### Variables
變數，跟 fragments 可以一起使用
```qraphql
query HeroComparison($first: Int = 3) {
  leftComparison: hero(episode: EMPIRE) {
    ...comparisonFields
  }
  rightComparison: hero(episode: JEDI) {
    ...comparisonFields
  }
}

fragment comparisonFields on Character {
  name
  friendsConnection(first: $first) {
    totalCount
    nodes {
      name
    }
  }
}
```

## mutation 語法範例

一般的 query 欄位中填入以下範例，其中 SomeMutation 可以不填或甜任意值
```graphql
mutation SomeMutation($input: CreateProjectInput!) {
  createProject(input: $input) {
    project {
      name
      id
    }
  }
}
```

在下方的變數欄位中填入

```grqphql
{
  "input":{
    "name":"product j",
    "organizationId":1,
    "workingMode":"ONLINE_ONLY"
  }
}
```
